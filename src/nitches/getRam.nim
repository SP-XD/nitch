import std/strutils

proc getRam*(): string =
  let
    fileSeq: seq[string] = readLines("/proc/meminfo", 3)

  let
    memTotalSeq: seq[string] = fileSeq[0].split(" ")
    memAvailableSeq: seq[string] = fileSeq[2].split(" ")

    memTotalInt: int = parseInt(memTotalSeq[^2]) div 1024
    memAvailableInt: int = parseInt(memAvailableSeq[^2]) div 1024

    memUsedInt: int = memTotalInt - memAvailableInt

  result = $(memUsedInt) & " | " & $(memTotalInt) & " MiB"
