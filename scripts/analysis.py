import numpy as np
import freud 
import beadspring as bsa
import sys

def main(argv):
    # Define the topology and trajectory files

    topology = argv[0]
    trajectory = argv[1]
    u = bsa.setup_universe(topology, trajectory)
    box = freud.box.Box.cube(u.dimensions[0])

    N_FRAMES = u.trajectory.n_frames
    N_ATOMS = u.atoms.n_atoms

    # Initialise the position and time arrays
    positions = np.zeros((N_FRAMES, N_ATOMS, 3))
    time = np.zeros(N_FRAMES)

    # Loop over the trajectory and load the positions
    for i,traj in enumerate(u.trajectory):                          
        positions[i] = u.atoms.positions   
        time[i] = u.trajectory.ts.data['time']
    
    print("positions", positions.shape)
    print("box", box.L)

    # Computing RDF from final timesnap
    rdf_bincenters, rdf, r_min, r_peak = bsa.compute_rdf(positions[-1], box, r_max=6.0, bins=50)

    # Computing MSD
    msd = bsa.compute_msd(positions)



if __name__ == '__main__':
    main(sys.argv[1:])
