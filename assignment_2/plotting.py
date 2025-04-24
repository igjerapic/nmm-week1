import numpy as np
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
    etot_vs_ecut = np.loadtxt("si.etot_vs_ecut").T
    plt.plot(etot_vs_ecut[0], etot_vs_ecut[1])
    plt.xlabel("Kinetic energy cutoff (Ry)")
    plt.ylabel("Total Energy (Ry)")
    plt.tight_layout()
    plt.savefig("etot_vs_ecut.svg", dpi=200)

    plt.clf()
    etot_vs_nkpoints = np.loadtxt("si.etot_vs_nkpoints").T
    plt.plot(etot_vs_nkpoints[0], etot_vs_nkpoints[1])
    plt.xlabel("Number k-points")
    plt.ylabel("Total Energy (Ry)")
    plt.tight_layout()
    plt.savefig("etot_vs_nkpoints.svg", dpi=200)


if __name__=="__main__":
    main()