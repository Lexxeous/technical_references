from csv import reader

def read_csv_file(filename):
    data = []
    with open(filename, newline='') as csvfile:
        csv_reader = reader(csvfile)
        for row in csv_reader:
            data.append(row)
    return data