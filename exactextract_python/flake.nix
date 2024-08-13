{
  description = "Flake for exactextract environment";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
  };

  outputs = {self, nixpkgs}@inputs:

    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in {

      devShells.x86_64-linux.default = pkgs.mkShell {
        name = "exactextract";

        venvDir = "./.venv";

        buildInputs = [
          pkgs.python311Packages.python
          pkgs.python311Packages.venvShellHook
          pkgs.python311Packages.xarray
          pkgs.python311Packages.netcdf4
          pkgs.python311Packages.dask
          pkgs.python311Packages.scipy
          pkgs.python311Packages.ipython
          pkgs.python311Packages.matplotlib
          pkgs.python311Packages.seaborn
          pkgs.python311Packages.numpy
          pkgs.python311Packages.pandas
          pkgs.python311Packages.shapely
          pkgs.python311Packages.tkinter
          pkgs.python311Packages.geopandas
          pkgs.python311Packages.rasterio
          pkgs.python311Packages.holoviews
          pkgs.python311Packages.pyproj
          pkgs.python311Packages.joblib
          pkgs.python311Packages.pillow
          pkgs.python311Packages.scikit-learn
          pkgs.python311Packages.six
          pkgs.python311Packages.fiona
          pkgs.python311Packages.shapely
          pkgs.python311Packages.geopandas
          pkgs.python311Packages.gdal
          pkgs.python311Packages.tqdm
          # development packages
          pkgs.python311Packages.python-lsp-server
          pkgs.python311Packages.pyflakes
          pkgs.python311Packages.yapf
          pkgs.python311Packages.pycodestyle
          pkgs.python311Packages.pydocstyle
          pkgs.python311Packages.pybind11
          pkgs.python311Packages.ipykernel
          # non-python packages
          pkgs.pandoc
          pkgs.nco
          pkgs.libgcc
          pkgs.jupyter
          pkgs.cmake
          pkgs.gdal
          pkgs.geos
        ];

        postVenvCreation = ''
          unset SOURCE_DATE_EPOCH
          pip install --upgrade pip
          pip install -U p_tqdm
          git clone https://github.com/isciences/exactextract.git
          cd exactextract
          git checkout afb834b
          pip install .
          cd ..
        '';

        postShellHook = ''
          unset SOURCE_DATE_EPOCH
        '';
      };

    };
}
