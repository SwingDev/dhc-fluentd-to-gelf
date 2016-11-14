# Recommended usage

    docker run \
	  --label client=SWG \
	  --label project=OCT \
	  --label projectapp=FLUENTD \
	  --label service=alpine \
	  --label environment=local \
	  --log-driver=fluentd \
	  --log-opt fluentd-address=127.0.0.1:24224 \
	  --log-opt tag='{{ .DaemonName }}.{{ .ImageName  }}.{{ .Name }}.{{ .ID }}' \
	  --log-opt labels=client,project,projectapp,environment,service \
	  -it \
	  alpine:edge \
	  echo "..."
