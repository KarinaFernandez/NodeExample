SUBSCRIPTION="Azure para estudiantes"
RESOURCEGROUP="appsvc_rg_linux_centralus"
LOCATION="centralus"
PLANNAME="appsvc_asp_linux_centralus"
PLANSKU="B1"
SITENAME="simple-node-app-example"
RUNTIME="NODE|8.1"

# # login supports device login, username/password, and service principals
# # see https://docs.microsoft.com/en-us/cli/azure/?view=azure-cli-latest#az_login
# az login
# # list all of the available subscriptions
# az account list -o table
# # set the default subscription for subsequent operations
# az account set --subscription $SUBSCRIPTION
# # create a resource group for your application
# az group create --name $RESOURCEGROUP --location $LOCATION
# # create an appservice plan (a machine) where your site will run
# az appservice plan create --name $PLANNAME --location $LOCATION --is-linux --sku $PLANSKU --resource-group $RESOURCEGROUP
# # create the web application on the plan
# # specify the node version your app requires
# az webapp create --name $SITENAME --plan $PLANNAME --runtime $RUNTIME --resource-group $RESOURCEGROUP

# To set up deployment from a local git repository, uncomment the following commands.
# first, set the username and password (use environment variables!)
USERNAME="WeRock"
PASSWORD="WeRock2019"
az webapp deployment user set --user-name $USERNAME --password $PASSWORD

# now, configure the site for deployment. in this case, we will deploy from the local git repository
# you can also configure your site to be deployed from a remote git repository or set up a CI/CD workflow
az webapp deployment source config-local-git --name $SITENAME --resource-group $RESOURCEGROUP

# the previous command returned the git remote to deploy to
# use this to set up a new remote named "azure"
git remote add azure "https://$USERNAME@$SITENAME.scm.azurewebsites.net/$SITENAME.git"
# push master to deploy the site
# git push azure master

# browse to the site
# az webapp browse --name $SITENAME --resource-group $RESOURCEGROUP
