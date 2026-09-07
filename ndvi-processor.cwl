cwlVersion: v1.2
class: CommandLineTool

requirements:
  ResourceRequirement:
    ramMin: 4000
    coresMin: 1
  NetworkAccess:
    networkAccess: true
  DockerRequirement:
    dockerPull: ghcr.io/dmastrapasqua/processor-ndvi:0.1.0
  EnvVarRequirement:
    envDef:
      PATH: /app/.venv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
  InitialWorkDirRequirement:
    listing:
        - entry: $(inputs.input_item)
          entryname: input.json
        - entry: $(inputs.red_asset)
          entryname: red.tif
        - entry: $(inputs.nir_asset)
          entryname: nir.tif

inputs:
  input_item:
    type: File
    inputBinding:
      prefix: --input-item
      position: 1

  red_asset:
    type: File
    doc: "Red band GeoTIFF, referenced by input.json's assets.red.href"

  nir_asset:
    type: File
    doc: "NIR band GeoTIFF, referenced by input.json's assets.nir.href"

  output_dir:
    type: string
    default: "output"
    inputBinding:
      prefix: --output
      position: 2

  run_id:
    type: string
    inputBinding:
      prefix: --run-id
      position: 3

outputs:
  stac_collection:
    type: Directory
    outputBinding:
      glob: $(inputs.output_dir)