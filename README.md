SD-Batch
========

This is a script that creates Space Designer presets in batches.

A few years ago I bought a bunch of guitar cabinet Impulse Responses and needed a way to put those in Space Desinger in order to rapidly choose them using the Library pane in Logic Pro.

It doesn't do much, really. It merely takes my "Dummy Preset.pst" and uses it to make a SpaceDesigner preset for every WAV file in with a folder (configurable inside `spaced.rb`).

To run it just type:

    ruby spaced.rb

The code is very simple and short. Modify it if you want to do anything more adventurous.
