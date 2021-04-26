+++
title = "Hardware"
description = "Hardware used by James Moriarty."
date = "2021-02-10"
aliases = ["tools"]
author = "James Moriarty"
+++

This page is dedicated to my interest in consumer hardware. I'm currently running the following:

### Personal Laptop

After spending the majority of my professional career on MacBooks - I use a Surface Pro 6 to run ... Linux. I use this for general open source development.

- Intel i5-8250U 4 Cores@1.6-3.4GHz
- Samsung 8GB DDR3@1600MHz
- Toshiba 128GB SSD NVMe

```
$ hdparm -Tt /dev/sda

/dev/sda:
 Timing cached reads:   17742 MB in  1.99 seconds = 8922.07 MB/sec
 Timing buffered disk reads: 1358 MB in  3.00 seconds = 452.51 MB/sec
```

### Budget Build Desktop

I've been continually impressed by the value of AMD's recent offerings. I use this desktop for development of Go, Windows, graphics, and security.

- AMD Ryzen 3 1300X 4 Core@3.5-3.7GHz
- Corsair Vengeance LPX 16GB (2x8GB) DDR4@2400MHz
- Samsung 970 EVO Plus 250GB SSD NVMe
- Asus Strix RX570@1300MHz (2048SP) 4GB DDR5@7000MHz

### Home Kubernetes

I use this to run low power Intel NUC gitops K3s Kubernetes single node "cluster". I use this primarily for media, storage, and monitoring.

- Intel i3-4010U 2 Core@1.7GHz
- Corsair 8GB (1x8GB) DDR3@1600MHz
- Micron M600 128GB SSD mSATA