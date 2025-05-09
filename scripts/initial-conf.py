import numpy as np
import os
def generate_data_file(filename, num_beads, bond_length=0.97, pad=2.0):
    atom_type = 1
    bond_type = 1
    mass = 1.0
    x_len = (num_beads - 1) * bond_length + 2 * pad
    y_len = 5.0  # narrow slab
    z_len = 5.0
    x0 = pad
    y0 = y_len / 2
    z0 = z_len / 2
    with open(filename, 'w') as f:
        f.write("LAMMPS data file - lamellar Kremer-Grest chain\n\n")
        f.write(f"{num_beads} atoms\n")
        f.write(f"{num_beads - 1} bonds\n\n")
        f.write("1 atom types\n1 bond types\n\n")
        f.write(f"0.0 {x_len:.2f} xlo xhi\n")
        f.write(f"0.0 {y_len:.2f} ylo yhi\n")
        f.write(f"0.0 {z_len:.2f} zlo zhi\n\n")
        f.write("Masses\n\n")
        f.write(f"1 {mass}\n\n")
        f.write("Atoms\n\n")
        for i in range(num_beads):
            x = x0 + i * bond_length
            f.write(f"{i+1} 1 {atom_type} {x:.5f} {y0:.5f} {z0:.5f}\n")
        f.write("\nBonds\n\n")
        for i in range(1, num_beads):
            f.write(f"{i} {bond_type} {i} {i+1}\n")
# Generate for these chain lengths
chain_lengths = [20, 50, 100, 200]
os.makedirs("data", exist_ok=True)
for N in chain_lengths:
    fname = f"data/polymer_N{N}.data"
    generate_data_file(fname, N)
    print(f"Generated {fname}")

