import click
from rdflib import Graph


@click.command()
@click.argument('turtle_file', type=click.Path(exists=True))
@click.argument('output_dir', type=click.Path())
def run(turtle_file, output_dir):
    g = Graph().parse(turtle_file, format='turtle')

    extension = str(turtle_file).split('.')[-1]
    file_name = str(turtle_file).replace('.' + extension, '')

    g.serialize(file_name + '.nt', format='nt')
    g.serialize(file_name + '.rdf', format='xml')
    g.serialize(file_name + '.n3', format='n3')
    g.serialize(file_name + '.jsonld', format='json-ld')


if __name__ == '__main__':
    run()