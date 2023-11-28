conda activate alphapose

echo Start processing file $1
echo
echo
python scripts/single_inference.py --indir $1 --cfg configs/halpe_26/resnet/256x192_res50_lr1e-3_1x.yaml --checkpoint pretrained_models/halpe26_fast_res50_256x192.pth

conda deactivate

conda activate sklgen

cd ../MotionBERT

vid_path='/mnt/h/Datasets/Own/WiMesh-X/data/'$1/$1.mp4
json_path='/mnt/h/Datasets/Own/WiMesh-X/data/'$1/skl/alphapose-results.json
out_path='/mnt/h/Datasets/Own/WiMesh-X/data/'$1/skl/

python infer_single.py --file $1 --vid_path $vid_path --json_path $json_path --out_path $out_path
python reverse_y_axis.py --file $1

conda deactivate

cd ../AlphaPose