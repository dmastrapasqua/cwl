cwlVersion: v1.2
class: CommandLineTool

requirements:
  ResourceRequirement:
    ramMin: 4000
    coresMin: 1
  NetworkAccess:
    networkAccess: true
  DockerRequirement:
    dockerPull: docker.io/dmastrapasqua/processor-vegetation-health-anomalies:test-obscured

baseCommand:
  - python
  - -c
  - "from archytas_flows.user.compute_carbon_markets_ndvi.src.plain_patcher import main; main()"

inputs:
  time:
    type: string
    inputBinding:
      prefix: --time
      position: 1

  area_name:
    type: string
    inputBinding:
      prefix: --area-name
      position: 2

  feature_collection:
    type: string
    inputBinding:
      prefix: --feature-collection
      position: 3

  output_dir:
    type: string
    default: "output"
    inputBinding:
      prefix: --output
      position: 4

outputs:
  stac_collection:
    type: Directory
    outputBinding:
      glob: $(inputs.output_dir)
