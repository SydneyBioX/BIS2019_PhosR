library(googleComputeEngineR)

project = "scpworkshop"
gce_global_project(project)

## setting up a 13GB RAM instance 
## see gce_list_machinetype() for options of predefined_type
vm = gce_vm(template = "rstudio",
            name = "phosr",
            disk_size_gb = 200,
            predefined_type = "n1-standard-4",
            user = "rstudio",
            password = "pushu")

## wait a bit, login at the IP it gives you
vm = gce_ssh_setup(vm,
                   username = "rstudio",
                   key.pub = "~/.ssh/id_rsa.pub",
                   key.private = "~/.ssh/id_rsa")

gce_rstudio_adduser(vm, username = "kevin", password = "kevin")


gce_push_registry(vm, 
                  save_name = "phosr",
                  container_name = "rstudio")


system("docker --version")
system("gcloud --version")
