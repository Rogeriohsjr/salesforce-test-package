# Migration Testing

This project is to test to migrate an Aura component with a dropdown from sandbox to production using the outbond from Salesforce.

Currently I am facing an issue where we can't migrate a component from Sandbox to Producton Org.

Steps to duplicate the issue.

[x] Create an Aura Component with a Dropdown
[x] Create a Custom Apex Code that extends the VisualEditor.DynamicPickList
[ ] Create a Managed Package
[ ] Install the Managed Package into a Sandbox
[ ] Add the Component into an Lightning Page Example Opportunity Page and select an Option
[ ] Using Salesforce Outbound Changes, select the Opportunity Page
[ ] In the Target Org(Production) try to validate the changes

## Create a Managed Package

1. Make sure we have authenticated into a the DevHub
2. Run

```
sf package create \
  --name "TestApp" \
  --description "My managed package" \
  --package-type Managed \
  --path force-app \
  --target-dev-hub DevHub
```

```
sf package list
```

```
sf package version create \
  --package TestApp \
  --installation-key-bypass \
  --code-coverage \
  --wait 20 \
  --target-dev-hub DevHub
```

### Check the Status of a Package

```
sf package version report --package 04tOK000000jMnZYAU --target-dev-hub DevHub
```

### Promote a Package Version

```
sf package version promote --package 04tOK000000jMnZYAU --target-dev-hub DevHub --no-prompt
```

### Install link

```
/packaging/installPackage.apexp?p0=04tOK000000jMnZYAU
```
