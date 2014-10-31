# deploy-api-cookbook

Deploys the Horntell API on production servers.

## Supported Platforms

Ubuntu.

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['deploy-api']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### deploy-api::default

Include `deploy-api` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[deploy-api::default]"
  ]
}
```

## License and Authors

Author:: Mohit Mamoria (mohit.mamoria@gmail.com)
