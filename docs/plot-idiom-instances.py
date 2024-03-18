import os
import pandas as pd
import matplotlib.pyplot as plt

# Get the list of CSV files in the directory
directory = "testdata/gapbs"
csv_files = [file for file in os.listdir(directory) if file.endswith('.csv')]
csv_files.sort()

# Define the number of rows and columns for the subplot grid
num_plots = len(csv_files)
num_cols = 2  # Number of columns
num_rows = (num_plots + num_cols - 1) // num_cols  # Calculate number of rows

# Create a new figure
fig, axs = plt.subplots(num_rows, num_cols, figsize=(15, 5*num_rows))

# Iterate over each CSV file and plot
for i, file in enumerate(csv_files):
    # Read the CSV file into a DataFrame
    df = pd.read_csv(os.path.join(directory, file))

    # Normalize memory_ops_in_idiom
    total_memory_ops = df['total_memory_ops'][0]
    df['memory_ops_in_idiom'] /= total_memory_ops / 100

    # Group by idiom_id and memory_ops_in_idiom, then sum the values
    grouped = df.groupby(['idiom_id', 'memory_ops_in_idiom']).size().unstack(fill_value=0)

    # Replace ones with the actual values of memory_ops_in_idiom
    grouped = grouped.apply(lambda x: x * grouped.columns, axis=1)

    # Calculate the total sum of memory operations for each idiom ID
    sum_memory_ops = grouped.sum(axis=1)

    # Sort the DataFrame by the total sum of memory operations in descending order
    sorted_index = sum_memory_ops.sort_values(ascending=False).index
    grouped_sorted = grouped.loc[sorted_index]

    # Reverse the order of columns
    grouped_sorted = grouped_sorted[grouped_sorted.columns[::-1]]

    # Plotting the stacked bar chart
    grouped_sorted.index = range(1, len(grouped_sorted) + 1)  # Resetting index to start from 1
    row = i // num_cols
    col = i % num_cols
    grouped_sorted.plot(kind='bar', stacked=True, ax=axs[row, col], legend=False)
    axs[row, col].set_title(f'Captured memory operations broken down by idiom instance - {file[:-4]}')
    axs[row, col].set_xlabel('Number of idioms')
    axs[row, col].set_ylabel('Captured memory operations (%)')

# Adjust layout
plt.tight_layout()

# Show plot
plt.savefig('docs/idiom-instance-breakdown.svg', format='svg')
