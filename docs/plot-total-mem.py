import os
import pandas as pd
import matplotlib.pyplot as plt

# Directory containing CSV files
directory = 'testdata/gapbs'

# Initialize lists to store file names and corresponding total_memory_ops values
file_names = []
total_memory_ops_values = []

# Iterate over CSV files in the directory
csv_files = [file for file in os.listdir(directory) if file.endswith('.csv')]
csv_files_sorted = sorted(csv_files)  # Sort CSV file names alphabetically

for file in csv_files_sorted:
    file_path = os.path.join(directory, file)
    # Read CSV file using pandas
    df = pd.read_csv(file_path)
    # Extract the first value of total_memory_ops column
    first_total_memory_op = df['total_memory_ops'].iloc[0]
    # Store file name (without .csv extension)
    file_names.append(file.replace('.csv', ''))
    # Store total_memory_ops value
    total_memory_ops_values.append(first_total_memory_op)

# Plotting the bar chart
plt.figure(figsize=(10, 6))
plt.bar(file_names, total_memory_ops_values)
plt.xlabel('Kernel')
plt.yscale('log')
plt.ylabel('Memory operations (log scale)')
plt.title('Total Memory Operations')
plt.xticks(rotation=45, ha='right')  # Rotate x-axis labels for better readability
plt.tight_layout()
plt.savefig('docs/total-memory-ops.svg', format='svg')
