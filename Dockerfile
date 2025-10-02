# Use the Jupyter PyTorch notebook image with CUDA 12 support
FROM quay.io/jupyter/pytorch-notebook:cuda12-python-3.11.8

# Configure the user for Binder compatibility
# Binder requires UID 1000
ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

# Switch to root to set up the user and permissions
USER root

# Create user with UID 1000 if it doesn't exist
# The base image might already have this user, so we check first
RUN id -u ${NB_UID} &>/dev/null || \
    adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    --home ${HOME} \
    ${NB_USER}

# Make sure the user owns the home directory
RUN chown -R ${NB_UID}:${NB_UID} ${HOME}

# Copy the repo contents to the home directory
COPY --chown=${NB_UID}:${NB_UID} . ${HOME}/

# Set the working directory
WORKDIR ${HOME}

# Switch back to the notebook user
USER ${NB_USER}

# Install any additional Python packages
# The base image should already have JupyterLab and PyTorch installed
# Add any extra requirements here if needed
RUN python3 -m pip install --no-cache-dir \
    matplotlib \
    seaborn \
    pandas \
    scikit-learn \
    tensorboard

# Expose the Jupyter port
EXPOSE 8888

# Set up the entrypoint to start Jupyter
# This allows the container to accept command-line arguments from Binder
ENTRYPOINT ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]