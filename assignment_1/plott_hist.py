
import numpy as np
import pandas as pd

import matplotlib.pyplot as plt
from cycler import cycler


plt.style.use('../scripts/default.mplstyle')

plt.rcParams['axes.prop_cycle'] = plt.cycler(cycler(color = [
                                    '#332288', 
                                    '#CC6677', 
                                    '#88CCEE',
                                    '#DDCC77', 
                                    '#117733', 
                                    '#882255', 
                                    '#44AA99', 
                                    '#999933', 
                                    '#AA4499',
                                    '#DDDDDD'
                                ]))

def main():
    full_bonded_new_chains = np.loadtxt("ass1_full_reacted_new-chains.txt", usecols=(1), comments="#")
    df = pd.DataFrame()

    df["cluster_sizes"] = full_bonded_new_chains
    ax = df.hist( bins=10, grid=False)
    ax[0,0].set_xlabel("Cluster size")
    ax[0,0].set_ylabel("Count")
    plt.title("")
    plt.tight_layout()
    plt.show()
    #plt.savefig("full_bonded_new-chain_counts.svg", dpi=300)

if __name__=="__main__":
    main()
