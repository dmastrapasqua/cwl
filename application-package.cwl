cwlVersion: v1.2
class: CommandLineTool

requirements:
  ResourceRequirement:
    ramMin: 4000
    coresMin: 1
  NetworkAccess:
    networkAccess: true
  DockerRequirement:
    dockerPull: ghcr.io/dmastrapasqua/ndvi-cdse:0.1.0

baseCommand:
  - python
  - /app/run.py

inputs:
  spatial_extent:
    type: float[]
    inputBinding:
      prefix: --spatial_extent

  collection_id:
    type: string
    default: "sentinel-2-l2a"
    inputBinding:
      prefix: --collection_id

  red_asset:
    type: string
    default: "B04_10m"
    inputBinding:
      prefix: --red_asset

  nir_asset:
    type: string
    default: "B08_10m"
    inputBinding:
      prefix: --nir_asset

  max_cloud_cover:
    type: float
    default: 20
    inputBinding:
      prefix: --max_cloud_cover

outputs:
  stac_collection:
    type: Directory
    outputBinding:
      glob: output