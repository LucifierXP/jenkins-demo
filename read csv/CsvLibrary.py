import csv
def read_data(filename):
    f = open(filename,  'r')
    csvfile = csv.reader(f)
    f.close
    return [row for row in csvfile]

def write_data(filename, datas):
    print(datas['email'])
    print(datas['mobile_no'])
    # TODO :: Write data to file output.csv
    f = open(filename, 'wb')
    fieldnames = ['email', 'mobile_no']
    csvfile = csv.DictWriter(f, fieldnames=fieldnames)
    csvfile.writeheader()
    csvfile.writerow(datas)
    f.close()

def append_data(filename, datas):
    print(datas['email'])
    print(datas['mobile_no'])
    # TODO :: Write data to file output.csv
    f = open(filename, 'ab')
    fieldnames = ['email', 'mobile_no']
    csvfile = csv.DictWriter(f, fieldnames=fieldnames)
    csvfile.writerow(datas)
    f.close()

def write_data_list(filename, datas):
    f = open(filename, 'wb')
    fieldnames = ['email', 'mobile_no']
    csvfile = csv.DictWriter(f, fieldnames=fieldnames)
    csvfile.writeheader()
    for data in datas:
        csvfile.writerow(data)
    f.close()