conda activate alphapose
for f in /mnt/h/Datasets/NTU/rgb_img_single/train/*;
do
        name=$(basename $f)
        python scripts/demo_inference.py --indir $name --cfg configs/halpe_26/resnet/256x192_res50_lr1e-3_1x.yaml --checkpoint pretrained_models/halpe26_fast_res50_256x192.pth
done
