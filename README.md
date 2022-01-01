# Dismantler

```
Dismantler - Dismantle secrets to shares using Shamir secret sharing

Usage: dismantler COMMAND

Available options:
  -h,--help                Show this help text

Available commands:
  dismantle                Dismantle secret to shares
  assemble                 Assemble shares to recreate secret
```

### `dismantle`

```
Usage: dismantler dismantle Secret [-n|--shares Shares] [-t|--threshold Threshold]
  Dismantle secret to shares

Available options:
  Secret                   Secret to dismantle
  -n,--shares Shares       Number of shares to create (default: 2)
  -t,--threshold Threshold Number of shares required to assemble
                           secret (default: 2)
  -h,--help                Show this help text
```

### `assemble`

```
Usage: dismantler assemble [SHARES...]
  Assemble shares to recreate secret

Available options:
  -h,--help                Show this help text
```
