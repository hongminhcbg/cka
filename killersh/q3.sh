#!/bin/bash
# write a commmand to scale the pods o3db-* down to one replica to save resources 
k scale statefulleset o3db --replicas=1


