# xd_slaughtererjob

A poultry processing job for QBCore FiveM servers. Catch live chickens at the farm, process and package them at the slaughterhouse, then sell the finished product to a dealer in the city.

![Status](https://img.shields.io/badge/status-archived-lightgrey)
![Platform](https://img.shields.io/badge/platform-FiveM-orange)
![Framework](https://img.shields.io/badge/framework-QBCore-blue)
![Language](https://img.shields.io/badge/language-Lua-000080)

> **Archived.** Built in 2021 and kept public as a reference. Not actively maintained.

## What it does

A four-stage production chain, each stage converting one item into the next:

| Stage | Location | Item produced |
| --- | --- | --- |
| Catch | Farm, `-68.4, 6248.4, 31.2` | `alivechicken` |
| Process | Slaughterhouse, two points around `-96.0, 6206.9, 31.0` | `slaughteredchicken` |
| Package | Slaughterhouse, two points around `-106.4, 6204.3, 31.0` | `packagedchicken` |
| Sell | Chicken Dealer, `-1177.2, -890.7, 13.8` | Cash |

Two map blips are created automatically: **Slaughter House** and **Chicken Dealer**.

Each stage has two interaction points, so more than one player can work the line at the same time.

## Requirements

- A FiveM server
- QBCore, or any framework exposing a `GetObject`-style event

## Installation

1. Copy the `xd_slaughtererjob` folder into your server's `resources` directory.
2. Add it to your `server.cfg`:

   ```cfg
   ensure xd_slaughtererjob
   ```

3. Add the three items below to your shared items file.
4. Add matching images (`alivechicken.png`, `slaughteredchicken.png`, `packagedchicken.png`) to your inventory resource.
5. Restart the server.

## Items

Add these to `qb-core/shared/items.lua`:

```lua
["alivechicken"] = {
    ["name"] = "alivechicken", ["label"] = "Alive Chicken",
    ["weight"] = 4000, ["type"] = "item", ["image"] = "alivechicken.png",
    ["unique"] = false, ["useable"] = false, ["shouldClose"] = false,
    ["combinable"] = nil, ["description"] = "Alive Chicken"
},
["slaughteredchicken"] = {
    ["name"] = "slaughteredchicken", ["label"] = "Slaughtered Chicken",
    ["weight"] = 4000, ["type"] = "item", ["image"] = "slaughteredchicken.png",
    ["unique"] = false, ["useable"] = false, ["shouldClose"] = false,
    ["combinable"] = nil, ["description"] = "Slaughtered Chicken"
},
["packagedchicken"] = {
    ["name"] = "packagedchicken", ["label"] = "Packaged Chicken",
    ["weight"] = 4000, ["type"] = "item", ["image"] = "packagedchicken.png",
    ["unique"] = false, ["useable"] = false, ["shouldClose"] = false,
    ["combinable"] = nil, ["description"] = "Packaged Chicken"
},
```

## Configuration

All coordinates and the framework event live at the top of `config.lua`:

```lua
Framework = "XD:GetObject"  -- change to "QBCore:GetObject" or your core's equivalent

startX, startY, startZ                -- chicken catching point
przetworniaX/Y/Z, przetworniaX2/Y2/Z2 -- processing points 1 and 2
pakowanieX/Y/Z, pakowanieX2/Y2/Z2     -- packaging points 1 and 2
sellX, sellY, sellZ                   -- sale point
```

## Files

| File | Role |
| --- | --- |
| `config.lua` | Coordinates, blips and framework event |
| `client/chicken_c.lua` | Job logic, markers and prompts |
| `client/framework_cl.lua` | Client-side framework bootstrap |
| `server/chicken_s.lua` | Item handling and payouts |
| `server/framework_sv.lua` | Server-side framework bootstrap |

## Credits

Built on a Polish-language processing job; internal variable names (`przetwornia`, `pakowanie`) keep their original naming.
