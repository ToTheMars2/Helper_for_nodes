import json, sys
from os.path import exists, abspath

check_id = int(sys.argv[-1])
answer = ''
path_file_out=abspath("out.json")
platform = sys.argv[1]
data = {}

if exists(path_file_out):

    with open(path_file_out, "r") as file:
            data = json.load(file)

    if platform not in data.keys():
            data[platform] = [check_id]
            answer = 'true'

    else:
        answer = 'false' if check_id in data[platform] else 'true'
        if answer == False:
            data[platform].append(check_id)
        data[platform].sort(reverse=True)

    with open(path_file_out, "w") as file:
        json.dump(data, file)

else:

    data[platform] = [check_id]
    with open(path_file_out, "w") as file:
        json.dump(data, file)
    answer = 'true'

print(answer)
