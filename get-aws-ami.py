import json

input_filename = "ami-latest.txt"
output_filename = "variables.json"
ami_id = ''

if input_filename:
    with open(input_filename, 'r') as f:
        line = f.read().split('\t')
        ami_id = str(line[0])
        print(ami_id)

if ami_id:
    with open(output_filename,'w') as f:
        json_dict = {'win_ami_latest_id' : ami_id}
        json.dump(json_dict,f,indent=4,ensure_ascii=False)


