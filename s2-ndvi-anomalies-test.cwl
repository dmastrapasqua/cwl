cwlVersion: v1.2
class: CommandLineTool

requirements:
  ResourceRequirement:
    ramMin: 4000
    coresMin: 1
  NetworkAccess:
    networkAccess: true
  DockerRequirement:
    dockerPull: docker.io/dmastrapasqua/processor-vegetation-health-anomalies:sentinel-2

baseCommand:
  - python
  - -c
  - "from carbon_markets_processors.processors.sentinel_2_ndvi_anomalies.plain_patcher import main; main()"

inputs:
  aoi:
    type: string
    inputBinding:
      prefix: --aoi
      position: 1

  observation_year:
    type: int
    inputBinding:
      prefix: --observation-year
      position: 2

  time_step:
    type:
      type: enum
      symbols: [auto, annual, monthly]
    default: auto
    inputBinding:
      prefix: --time-step
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
