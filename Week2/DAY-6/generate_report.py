from pathlib import Path
import pandas as pd

# Load the original dataset
csv_path = Path(__file__).resolve().parents[2] / "north_sales.csv"
df = pd.read_csv(csv_path)

# Run eight data-quality checks
checks = {
    "ID should be unique": df["id"].is_unique,
    "ID should not be missing": df["id"].notna().all(),
    "Product should not be missing": df["product"].notna().all(),
    "Region should not be missing": df["region"].notna().all(),
    "Amount should be non-negative": (df["amount"] >= 0).all(),
    "Quantity should be positive": (df["quantity"] > 0).all(),
    "Discount should be between 0 and 1": df["discount"].between(0, 1).all(),
    "Sale date should be valid": pd.to_datetime(
        df["sale_date"], errors="coerce"
    ).notna().all(),
}

# Create HTML report rows
rows = "\n".join(
    f"<tr><td>{name}</td><td>{'PASS' if passed else 'FAIL'}</td></tr>"
    for name, passed in checks.items()
)

html = f"""<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>North Sales Data Quality Report</title>
<style>
body {{ font-family: Arial, sans-serif; margin: 40px; }}
table {{ border-collapse: collapse; width: 100%; }}
th, td {{ border: 1px solid #ccc; padding: 10px; text-align: left; }}
th {{ background: #eee; }}
</style>
</head>
<body>
<h1>North Sales Data Quality Report</h1>
<p>Dataset: north_sales.csv</p>
<p>Rows: {len(df)} | Columns: {len(df.columns)}</p>
<p>Missing values: {int(df.isna().sum().sum())}</p>
<table>
<tr><th>Expectation</th><th>Result</th></tr>
{rows}
</table>
<h2>Recommendations</h2>
<ul>
<li>Validate incoming sales records.</li>
<li>Reject negative amounts and invalid discounts.</li>
<li>Validate sale dates and required fields.</li>
<li>Monitor data freshness daily.</li>
<li>Repeat testing on a larger dataset.</li>
</ul>
</body>
</html>
"""

output_path = Path(__file__).resolve().parent / "validation_report.html"
output_path.write_text(html, encoding="utf-8")

print(f"Report created: {output_path}")
print(f"Checks passed: {sum(checks.values())}/{len(checks)}")