#!/usr/bin/env python3
import argparse
import pandas as pd

def compute_memory_ops_sum(df, idiom_ids):
    total_sum = 0
    for idiom_id in idiom_ids:
        # Filter the dataframe based on the current idiom_id
        filtered_df = df[df['idiom_id'] == idiom_id]

        # Compute the sum of memory_ops_in_idiom over the first total_memory_ops
        memory_ops_sum = filtered_df['memory_ops_in_idiom'].sum() / df.iloc[0]['total_memory_ops']

        # Accumulate the sum
        total_sum += memory_ops_sum

    return total_sum

def main():
    # Parse command-line arguments
    parser = argparse.ArgumentParser(description='Compute sum of memory_ops_in_idiom over the total_memory_ops for a given idiom_id.')
    parser.add_argument('filename', type=str, help='CSV file name')
    parser.add_argument('idiom_ids', nargs='+', type=int, help='idiom_ids to compute sum for')
    args = parser.parse_args()

    # Read the CSV file
    df = pd.read_csv(args.filename)

    # Compute memory ops sum
    result = compute_memory_ops_sum(df, args.idiom_ids)
    print(result)

if __name__ == "__main__":
    main()
