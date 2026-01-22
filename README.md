This repository provides a complete OpenFOAM case for the classic **flow over a cylinder** benchmark. This setup is primarily used to study fundamental fluid dynamics phenomena such as the development of the boundary layer, flow separation, and the formation of the **Von Kármán vortex street**.

The simulation is configured to analyze flow behavior at specific Reynolds numbers, allowing for the calculation of critical aerodynamic parameters like the **Strouhal number**, **Drag coefficient ($C_d$)**, and **Lift coefficient ($C_l$)**.

**Key Features:**
*   **OpenFOAM Standard Setup:** Contains the essential case structure:
    *   `0/`: Definition of initial and boundary conditions (velocity $U$, pressure $p$, etc.).
    *   `constant/`: Includes `polyMesh` (generated via `blockMesh` or `snappyHexMesh`) and transport/turbulence properties.
    *   `system/`: Solver settings (`controlDict`), discretization schemes (`fvSchemes`), and solution algorithms (`fvSolution`).
*   **Vortex Shedding Analysis:** Configured for transient solvers (like `icoFoam` or `pimpleFoam`) to capture the time-accurate oscillation of the wake.
*   **Mesh Configuration:** Features a refined mesh around the cylinder surface and in the wake region to accurately resolve the pressure gradients and shedding frequency.
*   **Post-Processing:** Includes a `.foam` file for visualization in **ParaView**, making it easy to generate animations of pressure contours and velocity streamlines.

### **Technical Stack:**
*   **Core Tool:** OpenFOAM (Open Source Field Operation and Manipulation)
*   **Programming/Scripting:** C++ (Dictionaries) and Shell scripting (Allrun/Allclean scripts)
*   **Visualization:** ParaView

### **Use Cases:**
*   **Academic Validation:** Comparing numerical results against experimental data (e.g., Roshko or Schlichting).
*   **Turbulence Modeling:** Testing the performance of different RANS or LES models on a standard geometry.
*   **CFD Education:** A foundational project for learning mesh sensitivity and solver stability.

### **Who Is This For?**
This project is an excellent resource for **CFD Students**, **Aerodynamicists**, and **Engineers** looking for a well-documented, "ready-to-run" cylinder flow case for validation or research purposes.
