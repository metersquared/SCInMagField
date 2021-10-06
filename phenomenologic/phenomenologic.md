# Phenomenological calculations
  
# Flux density


Flux densities are calculated using [`fluxdensitySquare(lpd, b, a, x, y)`](https://github.com/metersquared/SCInMagField/blob/main/phenomenologic/fluxdensitySquare.m)* *and [`fluxdensityHex(lpd, b, a, x, y)`](https://github.com/metersquared/SCInMagField/blob/main/phenomenologic/fluxdensityHex.m).




`lpd - London's penetration depth`




`b - Magnetic field strength`




`a - Lattice constant`




`x,y - Coordinates, can be scalar or mesh of coordinates `


  


[`dataHexCode.m`](https://github.com/metersquared/SCInMagField/blob/main/phenomenologic/dataHexCode.m) and [`dataSquareCode.m`](https://github.com/metersquared/SCInMagField/blob/main/phenomenologic/dataSquareCode.m) is used to generate flux density data [`datahex.mat`](https://github.com/metersquared/SCInMagField/blob/main/phenomenologic/datahex.mat) and [`datasquare.mat`](https://github.com/metersquared/SCInMagField/blob/main/phenomenologic/datasquare.mat) in hexagonal and square lattice respectively.




In the following codes, generated data were imported and plotted.




Flux density of the square lattice:



```matlab:Code
run("fluxPlotSquare.m")
```


![figure_0.png](phenomenology_images/figure_0.png)



Flux density of the hexagonal lattice:



```matlab:Code
run('fluxPlotHex.m')
```


![figure_1.png](phenomenology_images/figure_1.png)



Flux histogram of hexagonal lattice:



```matlab:Code
run('fluxPlotHistogram.m')
```


```text:Output
Warning: Class 'Annotate' uses an undocumented syntax to restrict property values. Use property validation syntax instead. This warning will become an error in a future release.
```


![figure_2.png](phenomenology_images/figure_2.png)

  
# Free energy


Free energy are calculated using [`freeEnergyHex(a, b, lpd, N)`](https://github.com/metersquared/SCInMagField/blob/main/phenomenologic/freeEnergyHex.m) and [`freeEnergySquare(a, b, lpd, N)`](https://github.com/metersquared/SCInMagField/blob/main/phenomenologic/freeEnergySquare.m).




`lpd - London's penetration depth`




`b - Magnetic field strength`




`a - Lattice constant`




\texttt{N - Lattice length (for one side, i.e. size is N*N)}


  


[`freeenergy.m`](https://github.com/metersquared/SCInMagField/blob/main/phenomenologic/freeenergy.m) is used to generate struct for energy of both hexagonal and square lattice in different lattice length `N`.




Plot source code:



```matlab:Code
run("freeEnergyPlot.m")
```


![figure_3.png](phenomenology_images/figure_3.png)

# Supercurrent


Supercurrent are calculated using [`currentSquare(lpd, b, a, x, y)`](https://github.com/metersquared/SCInMagField/blob/main/phenomenologic/currentSquare.m).




`lpd - London's penetration depth`




`b - Magnetic field strength`




`a - Lattice constant`




`x,y - Coordinates, can be scalar or mesh of coordinates `


  


[`dataCurrentSquareCode.m`](https://github.com/metersquared/SCInMagField/blob/main/phenomenologic/dataCurrentSquareCode.m) is used to generate flux density data [`datacurrentsquare.mat`](https://github.com/metersquared/SCInMagField/blob/main/phenomenologic/datacurrentsquare.mat) in square lattice.




Plot source code:



```matlab:Code
run('currentSquarePlot.m')
```


```text:Output
Warning: Using only the real component of complex data.
```


![figure_4.png](phenomenology_images/figure_4.png)

