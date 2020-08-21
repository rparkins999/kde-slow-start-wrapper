This is a wrapper for programs that start up slowly on kde.
As shown it is configured for Android Studio,
but you just need to edit the first four lines for something else.

The problem it is trying to solve is that if you have a large high resolution screen
and you use a tiling window manager, the splash window appears in the middle of the screen
and when the real window pops up the window manager avoids it and messes up the tiling.

On the other hand, if you turn off the splash window, you sit there for a long while
wondering if you really *did* start the program.

So this shell script pops up a message box down at the bottom right corner
of the screen, where the tiling window manager doesn't put anything
until there is no toom anywhere else,
and removes the message box when the program main window appears.

It also provides a working example of how to get around the fact that

```kdialog --geometry```

doesn't work.

The bit of logic involving xclock is because I like to keep an xclock
at the bottom right corner of my screen
and I don't want the message box on top of it.
