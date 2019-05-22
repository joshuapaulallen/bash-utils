# gitlab-clone-all.py
#
# This python script clones all repositories in a gitlab organization to the current directory, organized by group.
# Directories for groups are automatically created, and repositories that are already present are skipped.
#
# To get started, you will need to generate an api-key for your gitlab account with "api" permissions. Supply that as an argument to this script.
#
# Usage: python3 ./gitlab-clone-all.py blah.gitlab.io my-fancy-token
#

import sys, os, subprocess, gitlab;

if len(sys.argv) < 2:
	print("Expected two arguments.")
	print("Usage: python3 path-to-script.py gitlabHost gitlabApiKey [namespace-search]")
	print("Example: python3 ./script.py blah.gitlab.io my-fancy-token api")
	sys.exit()

gitlabHost = sys.argv[1]
gitlabUrl = "https://{0}".format(gitlabHost)
gitlabApiKey = sys.argv[2]
	
gl = gitlab.Gitlab(gitlabUrl, private_token=gitlabApiKey)

# iterate through each unarchived project
print("Fetching project data from gitlab...")
projects = gl.projects.list(all=True, archived=False, order_by='path', sort='asc')
cloneComplete = list()
cloneErrors = list()
for project in projects:
	# grab project name and namespace info
	projectName = getattr(project, 'name')
	projectPath = getattr(project, 'path')
	namespace = getattr(project, 'namespace')
	namespaceName = namespace['name']
	namespacePath = namespace['path']
	namespaceKind = namespace['kind']

	print("Found project: {0} / {1}".format(namespaceName, projectName))

	# only proceed if the namespace is a group (as opposed to a person, for example)
	if namespaceKind != "group":
		print("Skipping project with namespace {0} kind {1}".format(namespaceName, namespaceKind))
		print("")
		continue

	# create a directory for the name space, if one doesn't exist
	namespaceDir = "./{0}".format(namespaceName)
	namespaceDirExists = os.path.exists(namespaceDir)
	if not namespaceDirExists:
		os.makedirs(namespaceName)
		print("Created directory for namespace {0}".format(namespaceName))

	# clone the repo into the appropriate directory, unless it already exists
	projectDir = "./{0}/{1}".format(namespaceName, projectName)
	projectDirExists = os.path.exists(projectDir)
	if not projectDirExists:
		gitRepo = "git@{0}:{1}/{2}.git".format(gitlabHost, namespacePath, projectPath)
		targetDir = "./{0}/{1}".format(namespaceName, projectName)
		print("Start cloning repo for {0} / {1}".format(namespaceName, projectName))
		completedProcess = subprocess.run(["git", "clone", gitRepo, targetDir]) 	
		if completedProcess.returncode == 0:
			print("Finished cloning repo for {0} / {1}".format(namespaceName, projectName))
			cloneComplete.append(gitRepo)
		else:
			print("ERROR cloning repo for {0} / {1}".format(namespaceName, projectName))
			cloneErrors.append(gitRepo)
			
	else:
		print("Repo for {0} / {1} already present, skipping.".format(namespaceName, projectName))

	print("")

# report back to the user
print("Done!")
print("Cloned {0} repositories successfully".format(len(cloneComplete)))
if len(cloneErrors) > 0:
	print("Error cloning {0} repositories".format(len(cloneErrors)))
	print("Errors: {0}".format(' '.join(cloneErrors)))
