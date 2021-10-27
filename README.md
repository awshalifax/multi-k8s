# multi-k8s


#Steps below had to ran in a ruby container in order to create the encrypted gpc credential to authenticate travis CI
#In GCP create a service account in IAM and create the token with permission  Kubernetes Engine Admin 
$ docker run -it -v $(pwd):/app ruby:2.4 sh
$ gem install travis
$ travis login --github-token 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 --com
$ travis encrypt-file service-account.json -r <repo>/<docker_img> --com
#replace .json file for the generated .json.enc and push to repo
