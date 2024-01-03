Role: defile a set of rules    
examples:

    apiVersion: rbac.authorization.k8s.io/v1
    kind: Role
    metadata:
      namespace: my-namespace
      name: my-role
    rules:
    - apiGroups: [""]
      resources: ["pods", "services", "configmaps"] # Define the resources this role can access
      verbs: ["get", "list", "watch", "create", "update", "delete"] # Define allowed actions on these resources

SA: 

    - assign to pod, identity and permission to access resorces
    - assign to pod: Pod.spec.serviceAccountName

RoleBlinding:

    Link a role to a Sa or a user