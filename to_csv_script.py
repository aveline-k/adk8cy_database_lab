import pandas as pd

file_path = 'data/current_learning_objectives_raw_data.xlsx'
xls = pd.ExcelFile(file_path)

for sheet in xls.sheet_names:
    df = pd.read_excel(xls, sheet_name=sheet)
    csv_file_path = f'data/{sheet}.csv'
    df.to_csv(csv_file_path, index=False)
