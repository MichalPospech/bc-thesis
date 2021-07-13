import argparse
import seaborn as sb
import json
import sys
import pandas as pd
if __name__ == "__main__":
    with open(sys.argv[2]) as log_file:
        log = json.load(log_file)
    log_df = pd.DataFrame(log)
    plt = sb.lineplot(y=log_df[1], x=log_df[0])
    plt.get_figure().savefig(f"{sys.argv[1]}.svg")