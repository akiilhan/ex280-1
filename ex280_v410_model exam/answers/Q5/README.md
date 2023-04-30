## OpenShift Cluster Quotas Configuration

This project configures quotas for the OpenShift cluster in the manhattan project. The quotas are configured as follows:

- The ResourceQuota resource name is `ex280-quota`.
- The total amount of memory consumed across all containers may not exceed 1Gi.
- The total amount of CPU usage consumed across all containers may not exceed 2 full cores.
- The maximum number of replication controllers does not exceed 3.
- The maximum number of pods does not exceed 3.
- The maximum number of services does not exceed 6.

### Configuration Steps

To configure quotas in the OpenShift cluster, follow these steps:

1. Create a new quota using the `oc create quota` command. In this project, we used the following command:

   ```shell
   oc create quota --help
   ```
   get the first example and modify it to
   
   ```shell
   oc create quota ex280-quota --hard=cpu=2,memory=1Gi,pods=3,services=6,replicationcontrollers=3 -n manhattan
   ```
2. Verify the quota using the `oc get resourcequota` command. In this project, we used the following command:
   ```shell
   oc get resourcequotas -n manhattan
   ```
   
### Conclusion
Configuring quotas is an important step in managing resource usage in an OpenShift cluster. By following the steps outlined in this project, you can configure quotas for your project and ensure that resource usage is controlled within the specified limits.
