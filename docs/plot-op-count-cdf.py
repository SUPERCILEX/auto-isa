import os
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

def process_csv_file(csv_file):
    # Read CSV file
    df = pd.read_csv(csv_file)
    df = df.sort_values(by='memory_ops_in_idiom', ascending=False)

    # Calculate CDF
    total_memory_ops = df['total_memory_ops'][0]
    memory_ops_in_idiom = df['memory_ops_in_idiom']
    cdf = memory_ops_in_idiom.cumsum() / total_memory_ops * 100

    return np.array(cdf)

def plot_cdf_from_directory(directory):
    # Get list of CSV files in the directory
    csv_files = [file for file in os.listdir(directory) if file.endswith('.csv')]

    # Sort the file names alphabetically
    csv_files.sort()

    # Plot CDF for each CSV file
    for csv_file in csv_files:
        file_path = os.path.join(directory, csv_file)
        cdf = process_csv_file(file_path)

        # Extract id from file name for labeling
        file_id = os.path.splitext(csv_file)[0]

        # Plot raw CDF
        plt.plot(cdf, label=file_id)

    # Customize plot
    plt.xscale('log')
    plt.xlabel('Number of idiom instances')
    plt.ylabel('Captured memory operations (%)')
    plt.title('CDF of captured memory operations')
    plt.legend()
    plt.grid(True)
    plt.savefig('docs/cdf-op-count.svg', format='svg')
    plt.close()  # Close the plot to avoid overlapping with the next plot

    # Plot normalized CDF for each CSV file
    for csv_file in csv_files:
        file_path = os.path.join(directory, csv_file)
        cdf = process_csv_file(file_path)

        # Normalize CDF to end at 100
        cdf_normalized = cdf / cdf[-1]

        # Extract id from file name for labeling
        file_id = os.path.splitext(csv_file)[0]

        # Plot normalized CDF
        plt.plot(cdf_normalized, label=file_id)

    # Customize plot
    plt.xscale('log')
    plt.xlabel('Number of idiom instances')
    plt.ylabel('Captured memory operations')
    plt.title('Normalized CDF of captured memory operations')
    plt.legend()
    plt.grid(True)
    plt.savefig('docs/cdf-op-count-normalized.svg', format='svg')

directory_path = 'testdata/gapbs'
plot_cdf_from_directory(directory_path)
