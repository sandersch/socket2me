!SLIDE

# Thread Pool

!SLIDE

# Explanation

Basically the same as _Preforking_, but with threads instead of processes

!SLIDE

# Considerations

  * Similar advantages to _Preforking_
  * Less separation when compared for process-based model
  * Uses less memory than process-based pattern
  * MRI GIL vs JRuby and Windows

!SLIDE

# Examples

  * Puma
