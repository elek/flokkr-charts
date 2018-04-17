# Helm Chart repository for flokkr

Experimental helm charts based on flokkr docker images. 

 * Ozone: HDFS cluster including Ozone and HDDS components 
 * Hadoop: HDFS + YARN cluster (hadoop 3)
 * Freon: Ozone test framework (requires configmap from ozone chart)

## Usage

Enable the repo in your helm:

```
helm repo add flokkr https://flokkr.github.io/charts
```

Download package indexed:

```
helm update
```

Install the helm charts:

```
helm install ozone
```

