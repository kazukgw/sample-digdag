# push
digdag push -e digdag:65432 --project simple -r "$(date +"%Y-%m-%d %H:%M:%S")" simple

# delete
digdag delete -e digdag:65432 simple
