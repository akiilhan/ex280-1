# Configuring Groups in OpenShift

This guide explains how to configure groups in OpenShift to meet the following requirements:
- The user account `armstrong` is a member of the `commander` group
- The user account `collins` is a member of the `pilot` group
- The user account `aldrin` is a member of the `pilot` group
- Members of the `commander` group have `edit` permission in the `apollo` project
- Members of the `pilot` group have `view` permission in the `apollo` project


## Steps

1. Create new groups:
   ```shell
   oc adm groups new <group-name>
   ```
   To Create group `commander` and `pilot`, use the following command:
   ```shell
   oc adm groups new commander
   oc adm groups new pilot
   ```

2. Add users to the group:
   ```shell
   oc adm groups add-users <group-name> <user-name> <user-name>
   ```
   To add a user to the `armstrong`,`collins`and`aldrin` to their respective groups, use the following command:
   ```shell
   oc adm groups add-users commander armstrong
   oc adm groups add-users pilot collins aldrin
   ```

3. Verify the groups and users:
   ```shell
   oc get groups
   ```

4. Assign roles to the groups:
   ```shell
   oc adm policy add-role-to-group edit commander -n apollo
   oc adm policy add-role-to-group view pilot -n apollo
   ```

## Conclusion

By following these steps, you have configured groups in OpenShift to meet the specified requirements. Members of the `commander` group have `edit` permission in the `apollo` project, while members of the `pilot` group have `view` permission in the `apollo` project.
