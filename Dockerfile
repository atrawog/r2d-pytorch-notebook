# Use official Jupyter PyTorch notebook with CUDA 12 support
# Base image already includes:
# - JupyterHub support via start-singleuser.py
# - Correct CMD ["start-notebook.py"] (no ENTRYPOINT)
# - User jovyan with UID 1000
# - PyTorch, matplotlib, pandas, seaborn, scikit-learn, scipy
# - Port 8888 exposed
FROM quay.io/jupyter/pytorch-notebook:cuda12-python-3.11.8

# Copy notebooks to home directory
# Base image already sets USER jovyan and WORKDIR /home/jovyan
COPY --chown=${NB_UID}:${NB_GID} notebooks/ ./notebooks/

# Copy project documentation
COPY --chown=${NB_UID}:${NB_GID} README.md LICENSE ./
