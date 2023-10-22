conda activate alphapose

for f in /mnt/e/yzk/NTU/rgb_img_single/train/*;
do
        name=$(basename $f)
        if [ ! -e "/mnt/e/yzk/NTU/motionbert_json/train/$name/alphapose-results.json" ]
        then
                echo Start processing file $name
                echo 
                echo
                python scripts/demo_inference.py --indir $name --cfg configs/halpe_26/resnet/256x192_res50_lr1e-3_1x.yaml --checkpoint pretrained_models/halpe26_fast_res50_256x192.pth
        else
                echo File $name already exists
                echo
        fi
done

conda deactivate