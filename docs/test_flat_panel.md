From [this](https://www.astrobin.com/forum/c/astrophotography/equipment/flat-panel-for-the-zwo-asi294mm-pro/?page=1) Astrobin thread:

* Set up telescope and camera as when taking flat frames.
* Shoot 10 flat frames with similar median brightness at about 30,000 ADU (`set #1`).
* Rotate the flat light source by 90° leaving the camera and telescope in the same position.
* Shoot 10 more flat frames with similar median brightness at about 30,000 ADU (`set #2`).
* In PixInsight, integrate `set #1` using Image_Integration as you would for creating a Master Flat.
* Name the `set #1` integrated result `Flat_00_Deg`.
* In PixInsight, integrate `set #2` using Image_Integration as you would for creating a Master Flat.
* Name the `set #2` integrated result `Flat_90_Deg`.
* Use Pixel Math to divide one integrated result by the other and normalize it: `Flat_00_Deg / Flat_90_Deg / 2.0`
  Be sure to select Create New Image and select the output Sample Format to be 32 bit Floating Point.
* Name this new image `Flat_Diff`.
* Run the Flat Contour Plot script on the Flat_Diff frame. Select the script parameters as: `50, 2.5, 15, 50`
* On the resulting contour plot, note the numbers shown at the top (Max) and bottom (Min) along the right side.
* Calculate the total non-uniformity in the Flat as: `total_non-uniformity = (Max - Min) / ((Max + Min) / 2)`
* You can optionally divide this by 2 to get the ± deviation from the mean value.

For general astrophotography, if your number is 5% or less, you are pretty good. If it is 2% or less, you are about optimum for "pretty picture" photography. If it is less that 1%, you have an excellent flat light source. If your value is less than 0.5%, then your system is about as good as it can be and you should be able to perform high precision photometric measurements of star magnitudes into the range of 0.01 magnitude.

If your source is significantly worse than 5%, then add a layer or two of additional diffusing material and try again. As an alternative, you can use the method John Tucker uses and take multiple flat frames rotating the light source slightly between each and then stacking them.


