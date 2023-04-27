# Configure your OpenShift cluster to meet the following requirements:
## The following projects exist:
- apollo
- manhattan
- gemini
- bluebook
- titan

The user account armstrong is an administrator for project apollo and project gemini

The user account wozniak can view project titan but not administer or delete it 


## To create a new project in OpenShift, use the following command: 

```shell
oc new-project <project-name>
```

## Administrator Access for Armstrong

The user account `armstrong` must be granted administrator access for the `apollo` and `gemini` projects. 

To grant admin access to a user, use the following command:

```shell
oc adm policy add-role-to-user admin armstrong -n <project-name>
```

In this project, the following commands must be used:

```shell
oc adm policy add-role-to-user admin armstrong -n apollo
oc adm policy add-role-to-user admin armstrong -n gemini
```

## Viewer Access for Wozniak

The user account `wozniak` must be able to view the `titan` project but must not be able to administer or delete it.

To grant view access to a user, use the following command:

```shell
oc adm policy add-role-to-user view wozniak -n <project-name>
```

In this project, the following command must be used:

```shell
oc adm policy add-role-to-user view wozniak -n titan
```

## Conclusion

This project requires the creation of multiple OpenShift projects and the granting of administrator and viewer access to specific users. The `oc adm policy` command is used to configure project permissions in OpenShift.
