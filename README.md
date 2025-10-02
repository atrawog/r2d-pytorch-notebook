# r2d-pytorch-notebook

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/atrawog/r2d-pytorch-notebook/main)

PyTorch notebook environment for repo2docker with CUDA 12 support.

## Features

- **PyTorch** with CUDA 12 support
- **JupyterLab** interface
- **Python 3.11.8** environment
- Pre-installed ML libraries:
  - PyTorch (with CUDA 12)
  - NumPy, Pandas, Matplotlib, Seaborn
  - Scikit-learn
  - TensorBoard
- Example notebooks in `/notebooks` directory

## Quick Start

### Launch on Binder (Cloud)

Click the Binder badge above or use this link:
```
https://mybinder.org/v2/gh/atrawog/r2d-pytorch-notebook/main
```

### Local Docker Deployment

1. **Clone the repository:**
   ```bash
   git clone https://github.com/atrawog/r2d-pytorch-notebook.git
   cd r2d-pytorch-notebook
   ```

2. **Build the Docker image:**
   ```bash
   docker build -t pytorch-notebook .
   ```

3. **Run the container:**
   ```bash
   docker run -p 8888:8888 pytorch-notebook
   ```

4. **Access JupyterLab:**
   Open your browser and navigate to the URL shown in the terminal (usually `http://localhost:8888/lab`)

### Using repo2docker

If you have repo2docker installed:
```bash
jupyter-repo2docker https://github.com/atrawog/r2d-pytorch-notebook
```

## GPU Support

This image includes CUDA 12 support. To use GPU acceleration locally:

1. Ensure you have [NVIDIA Docker runtime](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html) installed
2. Run with GPU support:
   ```bash
   docker run --gpus all -p 8888:8888 pytorch-notebook
   ```

## Environment Details

- **Base Image:** `quay.io/jupyter/pytorch-notebook:cuda12-python-3.11.8`
- **Python Version:** 3.11.8
- **CUDA Version:** 12
- **PyTorch:** Latest compatible with CUDA 12
- **Jupyter:** JupyterLab (latest)

## Example Notebooks

The repository includes example notebooks in the `/notebooks` directory:
- `pytorch_basics.ipynb` - Introduction to PyTorch, CUDA detection, and basic neural network training

## Customization

### Adding Python Packages

Edit the `Dockerfile` and add packages to the pip install section:
```dockerfile
RUN python3 -m pip install --no-cache-dir \
    your-package-here \
    another-package
```

### Adding Notebooks

Place your `.ipynb` files in the `notebooks/` directory before building the image.

## Troubleshooting

### Port Already in Use
If port 8888 is already in use, map to a different port:
```bash
docker run -p 8889:8888 pytorch-notebook
```

### CUDA Not Available
- Ensure NVIDIA drivers are installed on your host system
- Verify NVIDIA Docker runtime is properly configured
- Check GPU availability: `nvidia-smi`

## Contributing

Feel free to submit issues and pull requests to improve this repository.

## License

This project uses the Jupyter Docker Stacks base image. Please refer to their licensing terms.
