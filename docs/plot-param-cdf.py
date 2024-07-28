#!/usr/bin/env python3
import os
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

def process_csv(csv_file):
    df = pd.read_csv(csv_file)
    grouped = df.groupby('num_parameters')['memory_ops_in_idiom'].sum()
    cumulative_sum = grouped.cumsum() / df['total_memory_ops'][0] * 100
    return cumulative_sum

def plot_cdf(data):
    plt.figure(figsize=(10, 6))
    for filename, cdf_values in sorted(data.items()):
        plt.plot(np.array(cdf_values.index), np.array(cdf_values.values), label=os.path.splitext(filename)[0])

    plt.xlabel('Number of parameters')
    plt.ylabel('Captured memory operations (%)')
    plt.legend()
    plt.xticks(data[list(data.keys())[0]].index)
    plt.title('CDF of captured memory operation by parameter count')
    plt.grid(True)
    plt.savefig('docs/cdf-param-count.svg', format='svg')

    # Create a separate plot for normalized data
    plt.figure(figsize=(10, 6))
    for filename, cdf_values in sorted(data.items()):
        normalized_values = cdf_values / cdf_values.max()
        plt.plot(np.array(normalized_values.index), np.array(normalized_values.values), label=os.path.splitext(filename)[0])

    plt.xlabel('Number of parameters')
    plt.ylabel('Captured memory operations')
    plt.legend()
    plt.xticks(data[list(data.keys())[0]].index)
    plt.title('Normalized CDF of captured memory operation by parameter count')
    plt.grid(True)
    plt.savefig('docs/cdf-param-count-normalized.svg', format='svg')

def main(directory):
    data = {}
    for filename in os.listdir(directory):
        if filename.endswith('.csv'):
            csv_file = os.path.join(directory, filename)
            cumulative_sum = process_csv(csv_file)
            data[filename] = cumulative_sum
    plot_cdf(data)

if __name__ == "__main__":
    directory = 'testdata/gapbs'
    main(directory)
