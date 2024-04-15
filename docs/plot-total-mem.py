import os
import pandas as pd
import matplotlib.pyplot as plt

# Directory containing CSV files
directory = 'testdata/gapbs'

# Initialize lists to store file names, total_memory_ops values, number of rows, and memory_ops_in_idiom values
file_names = []
total_memory_ops_values = []
num_rows_values = []
memory_ops_in_idiom_values = []

# Iterate over CSV files in the directory
csv_files = [file for file in os.listdir(directory) if file.endswith('.csv')]
csv_files_sorted = sorted(csv_files)  # Sort CSV file names alphabetically

for file in csv_files_sorted:
    file_path = os.path.join(directory, file)
    # Read CSV file using pandas
    df = pd.read_csv(file_path)
    # Extract the first value of total_memory_ops column
    first_total_memory_op = df['total_memory_ops'].iloc[0]
    # Calculate the sum of memory_ops_in_idiom
    sum_memory_ops_in_idiom = df['memory_ops_in_idiom'].sum()
    # Store file name (without .csv extension)
    file_names.append(file.replace('.csv', ''))
    # Store total_memory_ops value
    total_memory_ops_values.append(first_total_memory_op)
    # Store number of rows
    num_rows_values.append(len(df))
    # Store sum of memory_ops_in_idiom
    memory_ops_in_idiom_values.append(sum_memory_ops_in_idiom)

# Calculate the ratio of memory_ops_in_idiom over first_total_memory_op
ratio_memory_ops = [memory_ops / total_ops for memory_ops, total_ops in zip(memory_ops_in_idiom_values, total_memory_ops_values)]

# Plotting the scatter plot with adjusted point size
plt.figure(figsize=(10, 6))
plt.scatter(total_memory_ops_values, num_rows_values, s=[ratio * 1000 for ratio in ratio_memory_ops], alpha=0.5)
plt.xlabel('Total memory operations')
plt.ylabel('Number of idiom instances')
plt.title('Memory Operations vs Instances')
plt.xscale('log')
plt.yscale('log')
plt.grid(True)

# Annotate each point with file name, with slight offset
for i, txt in enumerate(file_names):
    plt.text(total_memory_ops_values[i] * 1.1, num_rows_values[i], txt, fontsize=10, va='top')

plt.tight_layout()
plt.savefig('docs/total-memory-ops.svg', format='svg')
