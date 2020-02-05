# <img src="../.pics/Lexxeous/lexx_headshot_clear.png" width="90"/> Lexxeous's Conda V_ENV Management <img src="../.pics/Python/conda_logo.png" width="90"/>

### Create/Delete Environment(s)

Create `Anaconda` virtual environment (with `pip` backend) to install `requirements.txt` packages:

```python
conda create -n <virtual_env_name> python=<X.Y.Z> pip # create V_ENV with pip backend
conda install pip # set pip as package manager for <virtual_env_name>
conda activate <virtual_env_name> # must be activated to add packages to virtual environment with pip backend
pip install -r requirements.txt # install all specified packages within "requirements.txt" for <virtual_env_name>
```

Create `Anaconda` virtual environment (with `anaconda` backend) with all global packages:

```python
conda create -n <virtual_env_name> python=<X.Y.Z> anaconda
```

Create `Anaconda` virtual environment (with `anaconda` backend) to install minimal packages:

```python
conda create -n <virtual_env_name> python=<X.Y.Z>
conda install --yes --file requirements.txt
```

Delete an `Anaconda` virtual environment:
```python
conda remove -n <virtual_env_name> --all
```

### Activate/Deactivate Environment(s)

Activate `Anaconda` virtual environment:
```python
conda activate <virtual_env_name>
```

Deactivate the `Anaconda` virtual environment:
```python
conda deactivate
```

### Install/Uninstall Package(s)

Install/Uninstall individual package to/from an `Anaconda` virtual environment:
```python
conda install -n <virtual_env_name> <pkg_name>
conda uninstall -n <virtual_env_name> <pkg_name>
```

### Misc

View `Anaconda` virtual environment information:
```python
conda info # returns information about your Anaconda environment
conda info -e # view all available `Anaconda` virtual environments
```

View list of packages installed for an individual `Anaconda` virtual environment:
```python
conda list -n <virtual_env_name>
```
